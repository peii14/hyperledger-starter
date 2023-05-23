
const { Contract } = require('fabric-contract-api');


class StarterChaincode extends Contract {

    async initLedger(ctx) {
        console.info('Initializing the ledger');
    }
    // ################PRIVATE DATA REGION################
    // SAMPLE PRIVATE DATA
    async submitKycData(ctx, customerId, encryptedKycData) {
        await ctx.stub.putPrivateData('customerPrivateData', customerId, Buffer.from(encryptedKycData));
    }

    async getKycData(ctx, customerId, financialInstitution, peerMSPID) {
        if (!this._isFinancialInstitution(financialInstitution, peerMSPID)) {
            throw new Error('Access denied: Only designated financial institutions can access KYC data');
        }

        const privateDataBuffer = await ctx.stub.getPrivateData('customerPrivateData', customerId);
        if (!privateDataBuffer || privateDataBuffer.length === 0) {
            throw new Error(`No KYC data found for customer: ${customerId}`);
        }

        const encryptedData = privateDataBuffer.toString('utf-8');
        return encryptedData;
    }
    // ################ ENDOF PRIVATE DATA REGION################

    // ################ PUBLIC DATA REGION################

    // ################ END OF PUBLIC DATA REGION################

}

module.exports = StarterChaincode;

