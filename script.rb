require 'net/http'
require 'json'
require 'nokogiri'

old_shopify_stores = {}

(1..100).each do |shop_id|
    url = URI.parse("https://checkout.shopify.com/#{shop_id}/sandbox/google_analytics_iframe")
    response = Net::HTTP.get_response(url)
    page_source = response.body

    doc = Nokogiri::HTML(page_source)

    allowlisted_urls = doc.css('#allowlistedUrls').attr('data-allowlistedurls')&.value
    store_url = "Unavailable store"

    if allowlisted_urls
        urls = JSON.parse(allowlisted_urls)
        store_url = urls.first
    end

    # Create an object with shopId as key and store URL as value
    old_shopify_stores["#{shop_id}"] = store_url
end

# Convert the Ruby hash to JSON
old_shopify_stores_json = old_shopify_stores.to_json

puts "Old Shopify Stores (JSON):"
puts old_shopify_stores_json
