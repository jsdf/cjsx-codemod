#!/usr/bin/env node

var Runner = require('jscodeshift/dist/Runner.js');

var transform = __dirname + '/transform.js';

const path = require('path');
const pkg = require('./package.json');
const opts = require('nomnom')
  .script('cjsx-codemod')
  .options({
    path: {
      position: 0,
      help: 'Files or directory to transform',
      list: true,
      metavar: 'FILE',
      required: true
    },
    cpus: {
      abbr: 'c',
      help: '(all by default) Determines the number of processes started.'
    },
    verbose: {
      abbr: 'v',
      choices: [0, 1, 2],
      default: 0,
      help: 'Show more information about the transform process'
    },
    dry: {
      abbr: 'd',
      flag: true,
      help: 'Dry run (no changes are made to files)'
    },
    print: {
      abbr: 'p',
      flag: true,
      help: 'Print output, useful for development'
    },
    extensions: {
      default: 'coffee,cjsx',
      help: 'File extensions the transform file should be applied to'
    },
    ignorePattern: {
      full: 'ignore-pattern',
      list: true,
      help: 'Ignore files that match a provided glob expression'
    },
    ignoreConfig: {
      full: 'ignore-config',
      list: true,
      help: 'Ignore files if they match patterns sourced from a configuration file (e.g., a .gitignore)',
      metavar: 'FILE'
    },
    jsxExpression: {
      full: 'jsx-expression',
      list: true,
      default: '`${REACT}.createElement(${ELEMENT}, ${ARGS})`',
      help: 'Javascript (not Coffeescript) expression to build output Coffeescript code which JSX markup compiles into'
    },
    jsxImport: {
      full: 'jsx-import',
      list: true,
      help: 'Extra statement added to the top of code which uses JSX markup. Use it to add a require() if using custom createElement DSL'
    },
    runInBand: {
      flag: true,
      default: false,
      full: 'run-in-band',
      help: 'Run serially in the current process'
    },
    silent: {
      abbr: 's',
      flag: true,
      default: false,
      full: 'silent',
      help: 'No output'
    },
    version: {
      flag: true,
      help: 'print version and exit',
      callback: function() {
        const requirePackage = require('jscodeshift/utils/requirePackage');
        return [
          `cjsx-codemod: ${pkg.version}`,
          ` - jscodeshift: ${requirePackage('jscodeshift').version}`,
        ].join('\n');
      },
    },
  })
  .parse();

Runner.run(
  transform, 
  opts.path,
  opts
);
