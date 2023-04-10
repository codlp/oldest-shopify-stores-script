# Script - Oldest Shopify Stores

## Context

On April 7th, I initiated an Easter hunt to find the oldest still-running Shopify stores.

I shared a Google Sheet where we could all add the old stores that we found:
https://docs.google.com/spreadsheets/d/1iG0bVFSuXs3PhYkrkYP4Lk3AakbNXxclYnA6rNzE0no/edit#gid=1574186361

80+ stores were added, along with their shopId so that we could see how old they were.

It was amazing to see all those ancient stores! Their layouts differ from the themes layouts that we know today and their content were often very funny.

The winner is https://fifarules.myshopify.com (shopId n°8).

This store was found by Fabio Filippi (https://www.linkedin.com/in/0xfab10/).

After trying all the shop domains ideas that he had, Fabio decided to "work smarter not harder". He figured out a trick:

1. Inspect the checkout page's code of one of the old stores (shopId n°13). There, he found an iframe with this src link: https://checkout.shopify.com/13/sandbox/google_analytics_iframe?sandbox_token=WI-1sqRBEh1Mcx_6OcT2Pg.

2. From this URL, he deducted a generic URL that would allow him to retrieve any store URL based on its shopId: https://checkout.shopify.com/[SHOPID]/sandbox/google_analytics_iframe

3. After trying this URL for a specific shopId, he checks the page's source code and finds the shop URL.

Based on this URL, I wrote this ruby script to retrieve the URLs of the 100 oldest Shopify stores.

## How to use this script

You can use this script to retrieve the URLs of any Shopify stores based on their shopId.
