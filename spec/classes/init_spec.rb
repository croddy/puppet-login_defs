require 'spec_helper'
describe 'login_defs' do
  let(:facts) do
    {
      os: {
        family: 'RedHat',
        release: {
          major: 7,
        },
      },
    }
  end

  context 'with default parameters' do
    header = <<-EOT
#
# HEADER: This file is managed by Puppet
# HEADER: Do not make modifications directly!
#
###############################################################################
#
# /etc/login.defs - Configuration control definitions for the login package.
#
EOT

    default_options = {
      'CREATE_HOME'     => 'yes',
      'ENCRYPT_METHOD'  => 'SHA512',
      'GID_MAX'         => '60000',
      'GID_MIN'         => '500',
      'MAIL_DIR'        => '/var/spool/mail',
      'PASS_MAX_DAYS'   => '99999',
      'PASS_MIN_LEN'    => '5',
      'PASS_WARN_AGE'   => '7',
      'UID_MAX'         => '60000',
      'UID_MIN'         => '500',
      'UMASK'           => '022',
      'USERGROUPS_ENAB' => 'yes',
    }
    content = default_options.map { |k, v| "#{k} #{v}" }.join("\n")

    it { is_expected.to contain_class('login_defs') }
    it { is_expected.to contain_file('/etc/login.defs').with_content(%r{#{header}#{content}}) }
  end

  context 'on an unsupported osfamily' do
    let(:facts) do
      {
        os: {
          family: 'windows',
          release: {
            major: 10,
          },
        },
      }
    end

    it 'fails when osfamily is windows' do
      is_expected.to raise_error(
        Puppet::Error, %r{windows not supported by login_defs}
      )
    end
  end
end
