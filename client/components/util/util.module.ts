'use strict';
const angular = require('angular');
import {UtilService} from './util.service';

export default angular.module('srcApp.util', [])
  .factory('Util', UtilService)
  .name;
