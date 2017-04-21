OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
provider :twitter, 'rH8S66dijW7cYX2veCSS0xtHK', 'MXAnfLXwxR0L4eILQSMjPMHClW081P8OW5fNS2QOSCpncLPn2A'
end