# frozen_string_literal: true

POSTING_CATEGORIES = [
  'Design',
  'Data Science',
  'Programming',
  'Customer Support',
  'Copywriting',
  'Devops/Sysadmin',
  'Sales/Marketing',
  'Business/Management',
  'Finance/Legal',
  'Product',
  'Education',
  'Translation/Transcription',
  'Medical/Health',
  'All Other'
].freeze

SERVICE_CATEGORIES = [
  'Design',
  'Data Science',
  'Programming',
  'Customer Support',
  'Copywriting',
  'Devops/Sysadmin',
  'Sales/Marketing',
  'Business/Management',
  'Finance/Legal',
  'Product',
  'Education',
  'Translation/Transcription',
  'Medical/Health',
  'All Other'
].freeze

REGIONAL_RESTRICTIONS = [
  'Anywhere 100% Remote Only',
  'USA Only',
  'North America Only',
  'Europe Only',
  'Americas Only',
  'Canada Only',
  'EMEA Only',
  'Asia Only',
  'Africa Only',
  'North America Only'
].freeze

SUPPORTED_CRYPTO = %w[
  xmr
  bch
  eth
  doge
  btc
  hex
].freeze

# 1. Litecoin
# 2. Dai / other stable coin
# 3. hex

## Potential
## Dash
## Travala

VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.freeze

# Might need to set a default crypto somewhere
CRYPTO = {
  bch: {
    logo: 'bch_logo.png',
    symbol: 'BCH',
    full_name: 'Bitcoin Cash',
    telegram_channel: 'https://t.me/joinchat/AAAAAFAYNKwUoEOOzAG1Fw',
    donation_address: 'bitcoincash:qztgkdeu3s6phhknfqnp05fp09urmnq3uuqx57q2k2'
  },
  xmr: {
    logo: 'xmr_logo.png',
    symbol: 'XMR',
    full_name: 'Monero',
    telegram_channel: 'https://t.me/joinchat/RtUEihgRc7DDZSNoRb_W1A',
    donation_address: '44Pwei4PvKa3WygSp8QR5dLj2gZWj3Kg7JHh7io6N7Um9haZ9bgPBEWCmz7cTX77TbE7gZqGctiHoNyKZ3xK1ZUv7KJXT9o'
  },
  eth: {
    logo: 'eth_logo.png',
    symbol: 'ETH',
    full_name: 'Ethereum',
    telegram_channel: 'https://t.me/ethereumjobs',
    donation_address: '0x0137bDc444CDF3E1791C3de08060AA2CFe26bD60'
  },
  doge: {
    logo: 'doge_logo.png',
    symbol: 'DOGE',
    full_name: 'Dogecoin',
    telegram_channel: 'https://t.me/dogecoinjobs',
    donation_address: 'D8x96iUJLs64UBjt3RRV1P5jAijNP7CiW2'
  },
  btc: {
    logo: 'btc_logo.png',
    symbol: 'BTC',
    full_name: 'Bitcoin',
    donation_address: '1sazDsAEmvWqDbyP85QWWEEG6AaPjvAQQ'
  },
  hex: {
    logo: 'hex_logo.png',
    symbol: 'HEX',
    full_name: 'Hex',
    telegram_channel: 'https://t.me/hexjobs',
    donation_address: '0x5c581a3fEDD44cC499f7CEA616Ea2FD1f8D35B34'
  }
}.freeze
