/**
 * 
 * @On(event = { "CREATE" }, entity = "my_New_ProjectSrv.Purchases")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
    const { Purchases, Customers } = cds.entities;

    // Extract the data from the request
    const { purchaseValue, customer_ID } = request.data;

    // Calculate reward points
    const rewardPoints = Math.floor(purchaseValue / 10);

    // Set the reward points in the purchase data
    request.data.rewardPoints = rewardPoints;

    // Update the related customer's total purchase value and total reward points
    if (customer_ID) {
        const customer = await SELECT.one.from(Customers).where({ ID: customer_ID });

        if (customer) {
            const updatedTotalPurchaseValue = (customer.totalPurchaseValue || 0) + purchaseValue;
            const updatedTotalRewardPoints = (customer.totalRewardPoints || 0) + rewardPoints;

            await UPDATE(Customers).set({
                totalPurchaseValue: updatedTotalPurchaseValue,
                totalRewardPoints: updatedTotalRewardPoints
            }).where({ ID: customer_ID });
        }
    }
}