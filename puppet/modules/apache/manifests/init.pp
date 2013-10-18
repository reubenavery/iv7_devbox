class apache {
  include apache::packages
  include apache::services
  include apache::files
  include apache::users
}
