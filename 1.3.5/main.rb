#!/usr/bin/env ruby
#encoding: utf-8

require 'digest'

# get a proper random value
number = (0..1000).to_a.sample
p "number: #{number}"
hash_sha256 = Digest::SHA256.hexdigest(number.to_s)
p "sha256: #{hash_sha256}"
hash_ripemd160 = Digest::RMD160.hexdigest(hash_sha256)
p "ripemd160: #{hash_ripemd160}"
double_hash = Digest::SHA256.hexdigest(Digest::SHA256.hexdigest('00' + hash_ripemd160))
p "double hash: #{double_hash}"
key = double_hash[0..7]
p "key: #{key}"
address = "#{hash_ripemd160}#{key}"
p "address: #{address}"