
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "hashes with predefined layouts, composite keys and default values",
  "AUTHOR" => "Henry Van Styn <vanstyn\@cpan.org>",
  "BUILD_REQUIRES" => {
    "FindBin" => 0,
    "Test::Exception" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Hash-Layout",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Hash::Layout",
  "PREREQ_PM" => {
    "Clone" => 0,
    "Hash::Merge::Simple" => 0,
    "Moo" => 0,
    "Scalar::Util" => 0,
    "Types::Standard" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.00",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



