set -e
NETWORK=testnet
OWNER=lucio.$NETWORK
MASTER_ACC=pool.$NETWORK
CONTRACT_ACC=devmeta.$MASTER_ACC
GOV_TOKEN=token.devmeta.$MASTER_ACC

#set meta-cli target
meta --cliconf -c $CONTRACT_ACC -acc $OWNER

export NODE_ENV=$NETWORK

## delete acc
#echo "Delete $CONTRACT_ACC? are you sure? Ctrl-C to cancel"
#read input
#near delete $CONTRACT_ACC $MASTER_ACC
#near create-account $CONTRACT_ACC --masterAccount $MASTER_ACC
#meta deploy ./res/metapool.wasm
meta new { owner_account_id:$OWNER, treasury_account_id:treasury$OPERATOR_ACC_SUFFIX, operator_account_id:operator$OPERATOR_ACC_SUFFIX, meta_token_account_id:$GOV_TOKEN } --accountId $MASTER_ACC
## set params@meta set_params
meta default_pools_testnet


## redeploy code only
#meta deploy ./res/metapool.wasm  --accountId $MASTER_ACC

#save last deployment  (to be able to recover state/tokens)
#cp ./res/metapool.wasm ./res/metapool.`date +%F.%T`.wasm
#date +%F.%T
