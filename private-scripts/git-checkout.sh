#!/bin/bash -e

BRANCH_OR_TAG=""
REMOTE_NAME=origin
GIT_FETCH_ONCE_DONE=false
FORCE_FLAG=false

# Parse arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--force)
            FORCE_FLAG=true
            shift
            ;;
        *)
            if [[ -z "$BRANCH_OR_TAG" ]]; then
                BRANCH_OR_TAG=$1
            else
                REMOTE_NAME=$1
            fi
            shift
            ;;
    esac
done

if [[ ! ${BRANCH_OR_TAG} ]]; then
    echo -e "${RED}First argument missing i.e. tag or branch name ${NONE}"
    exit 1
fi

# Handle force flag - delete local branch and remote reference
if [[ ${FORCE_FLAG} == true ]]; then
    echo -e "${YELLOW}Force flag detected. Cleaning up existing references...${NONE}"

    # Check if currently on the branch we want to delete
    currentBranch=$(git branch --show-current)
    if [[ "$currentBranch" == "$BRANCH_OR_TAG" ]]; then
        echo -e "${BLUE}Currently on branch [$BRANCH_OR_TAG]. Switching to main/master first...${NONE}"
        git checkout main 2>/dev/null || git checkout master 2>/dev/null || {
            echo -e "${RED}Cannot switch away from current branch. Please checkout to a different branch first.${NONE}"
            exit 1
        }
    fi

    # Delete local branch if it exists
    localReference=$(git rev-parse -q --verify ${BRANCH_OR_TAG}) || true
    if [[ "$localReference" != "" ]]; then
        echo -e "${BLUE}Deleting local branch [$BRANCH_OR_TAG]...${NONE}"
        git branch -D ${BRANCH_OR_TAG} || true
    fi

    # Delete remote tracking reference if it exists
    remoteRef=$(git show-ref refs/remotes/${REMOTE_NAME}/${BRANCH_OR_TAG}) || true
    if [[ "$remoteRef" != "" ]]; then
        echo -e "${BLUE}Deleting remote tracking reference [${REMOTE_NAME}/${BRANCH_OR_TAG}]...${NONE}"
        git branch -rd ${REMOTE_NAME}/${BRANCH_OR_TAG} || true
    fi

    # Fetch fresh from remote
    echo -e "${BLUE}Fetching fresh from remote [$REMOTE_NAME]...${NONE}"
    git fetch ${REMOTE_NAME}
    GIT_FETCH_ONCE_DONE=true
fi

localReference=$(git rev-parse -q --verify ${BRANCH_OR_TAG}) || true

# If there is no local specified branch or tag present
if [[ "$localReference" == "" ]]; then
    # Using a while loop here which will run only maximum of 2 times. First time it will check that if we have the local
    # reference of the remote branch. If the repository does not have local reference of remote branch then it will fetch
    # it from the remote and the next loop iteration will again check for the same condition.
    while true; do
        localRemoteReference=$(git show-ref ${BRANCH_OR_TAG}) || true

        # If remote branch reference does not exists
        if [[ "$localRemoteReference" == "" ]]; then
            echo -e "${RED}Local branch/tag does not exists with name [$BRANCH_OR_TAG]${NONE}"

            # Check if we have already done the "git fetch" and branch still doesn't exists (prevents infinite loop)
            if [[ ${GIT_FETCH_ONCE_DONE} == false ]]; then
                echo -e "${BLUE}Pulling from the remote [$REMOTE_NAME]${NONE}"
                GIT_FETCH_ONCE_DONE=true
                git fetch ${REMOTE_NAME}
            else
                echo -e "${RED}No branch/tag found with name [$BRANCH_OR_TAG]${NONE}"
                exit 1
            fi
        else
            # If specified name is a tag
            if [[ ${localRemoteReference} == *"/tags/"* ]]; then
                echo -e "${BLUE}Found local tag. Checking out to [$BRANCH_OR_TAG]${NONE}"
                git checkout ${BRANCH_OR_TAG}
            else
                echo -e "${BLUE}Found local remote reference of branch. Checking out to [$BRANCH_OR_TAG]${NONE}"
                # Create and git-checkout.sh to the new local branch from the local reference of the remote branch
                git checkout -b ${BRANCH_OR_TAG} ${REMOTE_NAME}/${BRANCH_OR_TAG}
            fi
            break
        fi
    done
else
    echo -e "${GREEN}Found branch or tag locally. Checking out to [$BRANCH_OR_TAG]${NONE}"
    git checkout ${BRANCH_OR_TAG}
fi