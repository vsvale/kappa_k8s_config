# Build spark image
- docker build . -t load-to-landing-diesel:1.0.0
- docker tag load-to-landing-diesel:1.0.0 vsvale/load-to-landing-diesel:1.0.0
- docker push vsvale/load-to-landing-diesel:1.0.0

# Apply yaml
