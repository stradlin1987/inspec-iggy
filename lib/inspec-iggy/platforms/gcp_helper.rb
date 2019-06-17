# helpers for working with InSpec-GCP profiles

require 'yaml'

module InspecPlugins::Iggy::Platforms
  class GcpHelper

    # find the additional parameters
    GCP_RESOURCE_QUALIFIERS = {
      'google_bigquery_table' => [:name, :project, :dataset],
      'google_cloudfunctions_cloud_function' => [:name, :project,:location],
      'google_compute_address' => [:name, :project,:location],
      'google_compute_autoscaler' => [:name, :project,:zone],
      'google_compute_disk' => [:name, :project,:zone],
      'google_compute_firewall' => [:name, :project],
      'google_compute_forwarding_rule' => [:name, :project,:region],
      'google_compute_health_check' => [:name, :project],
      'google_compute_http_health_check' => [:name, :project],
      'google_compute_instance' => [:name, :project, :zone],
      'google_compute_instance_group' => [:name, :project, :zone],
      'google_compute_instance_group_manager' => [:zone],
      'google_compute_region_backend_service' => [:region],
      'google_compute_region_instance_group_manager' => [:region],
      'google_compute_router' => [:region],
      'google_compute_subnetwork' => [:region],
      'google_compute_subnetwork_iam_policy' => [:region],
      'google_compute_target_pool' => [:name, :project, :region],
      'google_compute_vpn_tunnel' => [:region],
      'google_compute_zone' => [:zone],
      'google_container_cluster' => [:zone],
      'google_container_regional_cluster' => [:location],
      'google_kms_key_ring' => [:location],
      'google_project_iam_binding' => [:role],
    }.freeze

    # readme content
    def self.readme
    end

    # inspec.yml boilerplate content from
    # inspec/lib/plugins/inspec-init/templates/profiles/gcp/inspec.yml
    def self.inspec_yml
      yml = {}
      yml['inspec_version'] = '>= 2.3.5'
      yml['depends'] = [{
        'name' => 'inspec-gcp',
        'url' => 'https://github.com/inspec/inspec-gcp/archive/master.tar.gz',
      }]
      yml['supports'] = [{
        'platform' => 'gcp'
      }]
      return yml
    end
  end
end
