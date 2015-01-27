FROM ruby:2.1.4-onbuild

EXPOSE 3000
CMD ["rackup", "-o", "0.0.0.0", "-p", "3000"]
