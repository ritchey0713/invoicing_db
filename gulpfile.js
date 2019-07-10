var gulp = require('gulp');
var concat = require('gulp-concat');
var minify = require('gulp-minify');
var uglify = require('gulp-uglify');
var cleanCss = require('gulp-clean-css');
const stripCssComments = require('gulp-strip-css-comments');
var sass = require('gulp-sass');

// require angular-rails-templates

gulp.task('pack-js', function () {	
	return gulp.src([   
  'node_modules/jquery/dist/jquery.js',
  'node_modules/jquery-ujs/src/rails.js',
  'node_modules/bootstrap/dist/js/bootstrap.js',  
  'node_modules/select2/dist/js/select2.js',  
  'node_modules/bootbox/bootbox.js',  
  'assets/js/*.js', 
  ])    
		.pipe(concat('core.js'))
  .pipe(minify({
  ext:{
   min:'.js'
  },
  noSource: true
 }))
 // .pipe(uglify())
 .pipe(gulp.dest('app/assets/javascripts'));
});

// gulp.task('pack-angular', function () {	
// 	return gulp.src([
//     'node_modules/angular/angular.js',
//     'node_modules/angular-touch/angular-touch.js',
//     'node_modules/angular-loading-bar/src/loading-bar.js',  
//     'node_modules/angular-local-storage/dist/angular-local-storage.js',  
//     'node_modules/angular-ui-bootstrap/dist/ui-bootstrap-tpls.js',  
//     'node_modules/angular-ui-grid/ui-grid.js',  
//   ])
// 		.pipe(concat('angular.js'))
//   .pipe(minify({
//   ext:{
//    min:'.js'
//   },
//   noSource: true
//  }))  
//  .pipe(gulp.dest('app/assets/javascripts'));
// });

gulp.task('pack-css', function () {	
	return gulp.src([  
  'node_modules/bootstrap/dist/css/bootstrap.css',
  'assets/css/application.scss',
  'assets/css/mobiscroll.jquery.min.css',  
  'node_modules/angular-ui-grid/ui-grid.css',
  'assets/css/ui-grid.css.scss',
  'assets/css/ui-grid.min.css',
  'node_modules/angular-loading-bar/src/loading-bar.css',
  'node_modules/select2/dist/css/select2.css', 
  'assets/css/*.css', 
  ])
  .pipe(sass().on('error', sass.logError))
 	.pipe(concat('core.css'))
  .pipe(stripCssComments())
  .pipe(cleanCss())
		.pipe(gulp.dest('app/assets/stylesheets'));
});
 
gulp.task('default', ['pack-js', 'pack-css']);