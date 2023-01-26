help:  ## Display this help
	@printf '\n'
	@printf 'Usage:\n'
	@printf '\n'
	@printf '  make${RESET} ${CYAN}<target> ${YELLOW}[options]${RESET}\n'
	@printf '\n'
	@printf 'Options:\n'
	@printf '\n'
	@$(call global_option, "V [0|1]", "  Enable verbose mode (default:V=0)")
	@printf '\nTargets:\n'
	@awk 'BEGIN {FS = ":.*##";} /^[a-zA-Z_-]+:.*?##/ { printf "  ${CYAN}%-30s${RESET} ${YELLOW}%s${RESET}\n", $$1, $$2 } /^##@/ { printf "\n${GREEN}%s${RESET}\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

-include ./common.mk

ROOTDIR         = .
MOGO_URI        = mongodb://localhost:27017
MOGO_DB         = parkingApi
MOGO_COLLECTION = parkings

##@ Requirements
init_db: ## create db for data directory
	$Q (\
mkdir -p $(ROOTDIR)/data;\
npm install;\
)

install_modules: ## install node modules
	$Q (\
npm install;\
)

##@ Exploitation
start_db: ## start mongo
	$Q (\
mongod --dbpath $(ROOTDIR)/data;\
)

load_data: ## import date into mongo
	$Q (\
mongoimport --uri $(MOGO_URI) --jsonArray --db parkingApi --collection parkings --file $(ROOTDIR)/parkings.json;\
)

start_api: ## start api server
	$Q (\
node $(ROOTDIR)/index.js;\
)

clean_db: ## clean all data in mongo
	$Q (\
rm -rf $(ROOTDIR)/data;\
)

clean_node_modules: ## clean node_modules
	$Q (\
rm -rf $(ROOTDIR)/node_modules;\
)
