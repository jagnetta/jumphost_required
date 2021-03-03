#!/usr/bin/env ruby
# This was written by Zarek Harbour (I think, probably)
# Link to the original script, and general usage:
# https://wiki.fuze.global/display/INF/How+To+Use+A+Jumphost+in+your+SSH+Client+Configurations
#
require 'resolv'
begin
  exit 1 if Resolv.getaddress(ARGV[0]).start_with?('10.')
rescue Resolv::ResolvError
  exit 1
end
