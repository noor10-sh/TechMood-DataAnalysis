# Business Insights & Recommendations

## Executive summary
The supplied Orders data contains **$2,297,185.10 in sales**, **$286,393.48 in profit**, and an overall **12.47% profit margin** across **5,008 distinct orders**. The management decision should therefore focus on profitable growth rather than sales growth alone.

## Five evidence-based insights

1. **Sales are materially higher than profit.** Total sales are $2.30M, while profit is $286.39K. The 12.47% margin shows that pricing, discounting, shipping, returns, and product mix must be monitored together with revenue.

2. **Technology is the most profitable category.** It generates approximately **$145,454.95** in profit. Management should protect availability and prioritize high-margin Technology products in campaigns while monitoring stock-outs.

3. **The West region leads both sales and profit.** It produces approximately **$725,457.82** in sales and **$108,418.45** in profit. The Central region has the weakest regional margin at approximately **7.92%**, so it requires a review of discounts, freight, returns, and product mix before additional marketing investment.

4. **A small group of products can explain profit weakness.** The lowest-profit product in the supplied data is **Cubify CubeX 3D Printer Double Head Print**, with a loss of approximately **-$8,879.97**. Management should review its discount level, fulfillment cost, return rate, warranty cost, and pricing before continuing to promote it.

5. **Sales increased over the period, but profit did not keep pace consistently.** Sales rose from approximately **$484,247.50 in 2014** to **$733,143.88 in 2017**, while profit rose from approximately **$49,543.97** to **$93,440.29**. The annual dashboard view should be used to monitor margin compression rather than relying on revenue alone.

## Answers to the case-study questions

- **Is the decline linked to a product?** Yes. The bottom-profit product table identifies products with losses or weak profit contribution. The Cubify CubeX 3D Printer Double Head Print is the clearest immediate investigation target.
- **Is there a high-sales, low-profit region?** The Central region has the weakest margin among the regional summaries. It should be investigated even when its revenue is acceptable.
- **How did performance change over time?** Sales and profit both increased between 2014 and 2017, but the annual comparison shows that the business should track margin and profit growth, not only sales growth.
- **Which category is most profitable?** Technology.
- **What decision is recommended?** Shift promotional budget toward high-margin categories and products. At the same time, correct low-profit products and the Central region through pricing, discount, shipping, return, and assortment actions.

## Recommended management actions

Create a weekly exception report for products with negative profit or margin below the company threshold. Review discounts and fulfillment economics for Central-region orders. Keep the Technology category well stocked, and evaluate every campaign using incremental profit rather than sales volume alone.

## Data note
The source workbook contained `Orders`, `Return`, and `People` sheets. Return status was joined to Orders using `Order ID`. City was extracted from the `Location` field because there was no separate City column in the source data.

## References

[1]: /home/ubuntu/upload/ordersdata.xlsx "Supplied ordersdata.xlsx source workbook"

[2]: /home/ubuntu/sales_dashboard_delivery/Sales_Dashboard.xlsx "Sales Dashboard workbook generated from the supplied data"

[3]: /home/ubuntu/sales_dashboard_delivery/README.md "Project README"
