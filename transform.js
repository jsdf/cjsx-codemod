var coffeeReactTransform = require('coffee-react-transform');

module.exports = function(
  input, /* {
    path: file,
    source: source,
  } */
  jscodeshiftApi, /* {
    j: jscodeshift,
    jscodeshift: jscodeshift,
    stats: options.dry ? stats : empty
  } */
  options
) {
  var output = coffeeReactTransform(input.source, {
    jsxExpression: options.jsxExpression,
    jsxImport: options.jsxImport,
  });
  return output;
};
