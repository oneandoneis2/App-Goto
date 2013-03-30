
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Module::Build" => "0.3601",
    "Test::More" => "0.88"
  },
  "configure_requires" => {
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Utility for accessing remote servers via SSH",
  "dist_author" => [
    "Dominic Humphries <dominic\@oneandoneis2.com>"
  ],
  "dist_name" => "App-Goto",
  "dist_version" => "0.06",
  "license" => "perl",
  "module_name" => "App::Goto",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "perl" => "5.012000"
  },
  "script_files" => [
    "script/g2"
  ]
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
