# Watched a video in this link
# https://www.youtube.com/watch?v=0_2VBDoowHs&index=28&list=PL0p7Bh3siJCYXVyPw4wcTDyAHz2qjf1A2
# Apparently all I needed to do was just to set up my AWS account and set up the ENV pass, id, and bucket for Heroku


# https://devcenter.heroku.com/articles/direct-to-s3-image-uploads-in-rails
# Here we are going to configure AWS and create a global S3 constant:
=begin
Aws.config.update({
  region: 'Oregon',
  credentials: AWS::Credentials.new(ENV['AWS_ACCESS_KEY_ID'], ENV['AWS_SECRET_ACCESS_KEY']),
})

S3_BUCKET_NAME = AWS::S3::Resource.new.bucket(ENV['S3_BUCKET_NAME'])
=end