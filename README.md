# cjsx-codemod

A codemod for migrating off [coffee-react](https://github.com/jsdf/coffee-react-transform) CJSX

## Usage

Install it:

```
npm install -g cjsx-codemod
```

Print command line options:

```
cjsx-codemod
```

Run the codemod on a directory tree of CJSX code:

```
cjsx-codemod ./my-app
```

Convert to using some custom DSL instead of `React.createElement`:
```
cjsx-codemod --jsx-import='myDSL = require "my-dsl"' --jsx-expression='`myDSL(${ELEMENT}, ${ARGS})`' ./my-app
```

Convert to using [teact](https://www.npmjs.com/package/teact):
```
cjsx-codemod  --jsx-import='{crel} = require "teact"' --jsx-expression='`crel(${ELEMENT}, ${ARGS})`' ./my-app
```

Based on [jscodeshift](https://github.com/facebook/jscodeshift)
