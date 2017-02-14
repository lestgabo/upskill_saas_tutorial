
# https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails
# Here we are going to configure AWS and create a global S3 constant:
Aws.config.update({
  region: 'Oregon',
  credentials: AWS::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
})

S3_BUCKET_NAME = AWS::S3::Resource.new.bucket(ENV['S3_BUCKET_NAME'])