
const Map<String, List<Map<String, dynamic>>> ttcStationsData = {
  'line1': [
    // Yonge Branch (North to South)
    {'name': 'Vaughan Metropolitan Centre', 'lat': 43.8387, 'lng': -79.5056},
    {'name': 'Highway 407', 'lat': 43.8304, 'lng': -79.5167},
    {'name': 'Finch', 'lat': 43.7315, 'lng': -79.4008},
    {'name': 'North York Centre', 'lat': 43.7267, 'lng': -79.4392},
    {'name': 'Sheppard', 'lat': 43.7193, 'lng': -79.4396},
    {'name': 'Wellesley', 'lat': 43.6589, 'lng': -79.3822},
    {'name': 'Dundas', 'lat': 43.6658, 'lng': -79.3822},
    {'name': 'Queen', 'lat': 43.6527, 'lng': -79.3822},
    {'name': 'Bloor', 'lat': 43.6809, 'lng': -79.3822},
    {'name': 'College', 'lat': 43.6629, 'lng': -79.4008},
    {'name': 'Spadina', 'lat': 43.6675, 'lng': -79.4008},
    {'name': 'St. George', 'lat': 43.6673, 'lng': -79.4004},
    {'name': 'Osgoode', 'lat': 43.6616, 'lng': -79.3957},
    {'name': 'St. Andrew', 'lat': 43.6617, 'lng': -79.3957},
    {'name': 'King', 'lat': 43.6452, 'lng': -79.3957},
    {'name': 'Union', 'lat': 43.6426, 'lng': -79.3871},
  ],
  'line2': [
    // Bloor-Danforth (West to East)
    {'name': 'Kipling', 'lat': 43.6414, 'lng': -79.4903},
    {'name': 'Dundas West', 'lat': 43.6636, 'lng': -79.4608},
    {'name': 'Bathurst', 'lat': 43.6789, 'lng': -79.4062},
    {'name': 'Spadina', 'lat': 43.6675, 'lng': -79.4008},
    {'name': 'Avenue Road', 'lat': 43.6767, 'lng': -79.3902},
    {'name': 'Bay', 'lat': 43.6783, 'lng': -79.3871},
    {'name': 'Bloor-Yonge', 'lat': 43.6809, 'lng': -79.3822},
    {'name': 'Wellesley', 'lat': 43.6585, 'lng': -79.3822},
    {'name': 'College', 'lat': 43.6629, 'lng': -79.3822},
    {'name': 'Dundas', 'lat': 43.6658, 'lng': -79.3822},
    {'name': 'Queen', 'lat': 43.6527, 'lng': -79.3822},
    {'name': 'King', 'lat': 43.6452, 'lng': -79.3822},
    {'name': 'Greenwood', 'lat': 43.6809, 'lng': -79.3167},
    {'name': 'Coxwell', 'lat': 43.6809, 'lng': -79.3082},
    {'name': 'Broadview', 'lat': 43.6658, 'lng': -79.3608},
    {'name': 'Chester', 'lat': 43.6809, 'lng': -79.3403},
    {'name': 'Pape', 'lat': 43.6809, 'lng': -79.3289},
    {'name': 'Donlands', 'lat': 43.6809, 'lng': -79.3081},
  ],
  'line4': [
    // Sheppard (West to East)
    {'name': 'Kipling', 'lat': 43.7312, 'lng': -79.4903},
    {'name': 'Dundas West', 'lat': 43.7312, 'lng': -79.4608},
    {'name': 'Bathurst', 'lat': 43.7312, 'lng': -79.4062},
    {'name': 'Spadina', 'lat': 43.7312, 'lng': -79.4008},
    {'name': 'Avenue Road', 'lat': 43.7312, 'lng': -79.3902},
    {'name': 'Bay', 'lat': 43.7312, 'lng': -79.3871},
    {'name': 'Sheppard-Yonge', 'lat': 43.7312, 'lng': -79.3822},
    {'name': 'Bessarion', 'lat': 43.7312, 'lng': -79.3608},
    {'name': 'Leslie', 'lat': 43.7312, 'lng': -79.3403},
    {'name': 'Don Mills', 'lat': 43.7312, 'lng': -79.3289},
    {'name': 'Scarborough Centre', 'lat': 43.7312, 'lng': -79.2401},
  ],
};

const Map<String, String> lineColors = {
  'line1': '0xFFFFCC00', // Yellow
  'line2': '0xFF00A84F', // Green
  'line4': '0xFF662D91', // Purple
};

const Map<String, Map<String, String>> stationInfo = {
  'Union': {
    'description': 'Downtown Toronto\'s main transit hub',
    'amenities': 'Bathrooms, Food Services, Retail',
  },
  'Bloor-Yonge': {
    'description': 'Major shopping and transit interchange',
    'amenities': 'Bathrooms, Food Services, Retail',
  },
  'Spadina': {
    'description': 'Access to Chinatown and entertainment district',
    'amenities': 'Bathrooms, Food Services, Retail',
  },
};

