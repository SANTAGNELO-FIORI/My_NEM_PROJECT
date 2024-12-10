/**
 * 
 * @On(event = { "CREATE" }, entity = "my_New_ProjectSrv.Redemptions")
 * @param {Object} request - User information, tenant-specific CDS model, headers and query parameters
 */
module.exports = async function(request) {
    const { Redemptions, Customers } = cds.entities;

    // Extract the redemption data from the request
    const { customer_ID, redeemedAmount } = request.data;

    // Ensure the customer_ID and redeemedAmount are defined
    if (!customer_ID || redeemedAmount === undefined) {
        return request.error(400, 'Customer ID and redeemed amount must be provided.');
    }

    // Retrieve the customer record
    const customer = await SELECT.one.from(Customers).where({ ID: customer_ID });

    // Ensure the customer exists
    if (!customer) {
        return request.error(404, 'Customer not found.');
    }

    // Check if the customer has enough reward points
    if (customer.totalRewardPoints < redeemedAmount) {
        return request.error(400, 'Insufficient reward points.');
    }

    // Deduct the redeemed amount from the customer's total reward points
    customer.totalRewardPoints -= redeemedAmount;

    // Add the redeemed amount to the customer's total redeemed reward points
    customer.totalRedeemedRewardPoints += redeemedAmount;

    // Update the customer record
    await UPDATE(Customers).set({
        totalRewardPoints: customer.totalRewardPoints,
        totalRedeemedRewardPoints: customer.totalRedeemedRewardPoints
    }).where({ ID: customer_ID });
};