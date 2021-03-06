FULLCALENDAR_FILE_PATH = Rails.root.join('config', 'fullcalendar.yml')
config = File.exists?(FULLCALENDAR_FILE_PATH) ? YAML.load_file(FULLCALENDAR_FILE_PATH) || {} : {}
puts config
FullcalendarEngine::Configuration = {
  'editable'    => true,
  'header'      => {
    left: 'prev,next today',
    center: 'title',
    right: 'agendaWeek,month,agendaDay'
  },
  'defaultView' => 'agendaWeek',
  'height'      => 500,
  'slotMinutes' => 15,
  'dragOpacity' => 0.5,
  'selectable'  => true,
  'timeFormat'  => "h:mm t{ - h:mm t}"
}
FullcalendarEngine::Configuration.merge!(config)
FullcalendarEngine::Configuration['events'] = "#{FullcalendarEngine::Configuration['mount_path']}/events/get_events"
