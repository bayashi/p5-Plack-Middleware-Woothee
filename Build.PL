use strict;
use warnings;
use Module::Build;

my $build = Module::Build->new(
    license        => 'perl',
    dynamic_config => 0,
    dist_abstract  => 'Plack middleware for getting Woothee information',

    build_requires     => {
        'Test::More'            => '0.98',
        'Test::Requires'        => '0.06',
        'HTTP::Request::Common' => '0',
    },
    configure_requires => { 'Module::Build' => '0.38' },
    requires           => {
        perl         => '5.008001',
        'parent'     => '0',
        Woothee      => '0',
        Plack        => '1',
    },

    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'Plack/Middleware/Woothee',
    module_name => 'Plack::Middleware::Woothee',

    test_files           => (-d '.git' || $ENV{RELEASE_TESTING}) ? 't/ xt/' : 't/',
    recursive_test_files => 1,

    create_readme      => 1,
    create_license     => 1,
);
$build->create_build_script;
