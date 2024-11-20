Aws.config.update({
  region: 'eu-central-1',
  endpoint: 'http://localhost:4566', # LocalStack's default endpoint
  access_key_id: 'test', # Default credentials for LocalStack
  secret_access_key: 'test'
})
