// Copyright (c) Microsoft Corporation. All rights reserved.
// Licensed under the MIT License. See License in the project root for license information.
'use strict';

const oav = require('oav');
const glob = require('glob');
const path = require('path');

async function main() {
  let globPath = path.join(__dirname, '/specification/**/*.json');
  let swaggersToProcess = glob.sync(globPath, { ignore: ['**/examples/**/*.json', '**/quickstart-templates/*.json', '**/schema/*.json'] });

  // Useful when debugging a test for a particular swagger.
  // Just update the regex. That will return an array of filtered items.
  // swaggersToProcess = swaggersToProcess.filter(function(item) {
  //   return (item.match(/.*machinelearningservices.*/ig) !== null);
  // });
  for (const swagger of swaggersToProcess) {
    await oav.validateExamples(swagger, null, {consoleLogLevel: 'error', pretty: true});
  }
}

main()