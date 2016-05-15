use strict;
use warnings;

package Mojolicious::Plugin::Web::Auth::Site::Fitbit;

use Mojo::Base qw/Mojolicious::Plugin::Web::Auth::OAuth2/;

has access_token_url => 'https://api.fitbit.com/oauth2/token';
has authorize_header => 'Basic';
has authorize_url    => 'https://www.fitbit.com/oauth2/authorize';
has response_type    => 'code';
has user_info        => 1;
has user_info_url    => 'https://api.fitbit.com/1/user/-/profile.json';

sub moniker { 'fitbit' }

1;
__END__

# ABSTRACT: Fitbit OAuth Plugin for Mojolicious::Plugin::Web::Auth

=pod

=head1 SYNOPSIS

    # Mojolicious
    $self->plugin('Web::Auth',
        module      => 'Fitbit',
        key         => 'Fitbit consumer key',
        secret      => 'Fitbit consumer secret',
        on_finished => sub {
            my ( $c, $access_token, $access_secret ) = @_;
            ...
        },
    );

    # Mojolicious::Lite
    plugin 'Web::Auth',
        module      => 'Fitbit',
        key         => 'Fitbit consumer key',
        secret      => 'Fitbit consumer secret',
        on_finished => sub {
            my ( $c, $access_token, $access_secret ) = @_;
            ...
        };


    # default authentication endpoint: /auth/fitbit/authenticate
    # default callback endpoint: /auth/fitbit/callback

=head1 DESCRIPTION

This module adds L<Fitbit|https://dev.fitbit.com/docs/> support to
L<Mojolicious::Plugin::Web::Auth>.

=cut