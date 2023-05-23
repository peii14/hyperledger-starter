/*
 * Copyright IBM Corp. All Rights Reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 */

'use strict';

const StarterChaincode = require('./lib/starterChaincode');

module.exports.starterChaincode = StarterChaincode;
module.exports.contracts = [ StarterChaincode ];
