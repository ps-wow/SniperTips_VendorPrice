local SniperTips_VendorPrice = LibStub("AceAddon-3.0"):NewAddon("SniperTips_VendorPrice");

local LibTooltip = LibStub("SniperTips-2.0");

local tipColour = { 0.2, 0.6, 1 }

function SniperTips_VendorPrice:HandleItem(self, item)
  if item.sellPrice ~= nil then
    if (item.sellPrice == 0) then
      -- do nothing
    else
      count = GetItemCount(item.link);
      priceEach = GetCoinTextureString(item.sellPrice);
      priceAll = GetCoinTextureString(item.sellPrice * count);

      if (count > 1) then
        self:AddDoubleLine("Vendor Sell (All): ",priceAll,unpack(tipColour));
        self:AddDoubleLine("Vendor Sell (Each): ",priceEach,unpack(tipColour));
      else
        self:AddDoubleLine("Vendor Sell: ",priceAll,unpack(tipColour));
      end
    end
  end
end

LibTooltip:AddItemHandler(SniperTips_VendorPrice)
