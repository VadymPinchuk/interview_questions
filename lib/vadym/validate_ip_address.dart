void main() {
  print(validIPAddress('172.16.254.1.'));
  print(validIPAddress('172.16.254.1'));
  print(validIPAddress('172.016.254.1'));
  print(validIPAddress('172.16.256.1'));
  print(validIPAddress('1e1.4.5.6'));
  print(validIPAddress('2001:0db8:85a3:0:0:8A2E:0370:7334:'));
  print(validIPAddress('2001:0db8:85a3:0:0:8A2E:0370:7334'));
  print(validIPAddress('2001:0db8:85a3::0:8A2E:0370:7334'));
}

String validIPAddress(String ip) {
  if (ip.endsWith('.') ||
      ip.endsWith(':') ||
      ip.startsWith('.') ||
      ip.startsWith(':')) {
    return 'Neither';
  }
  if (isIPv4(ip)) {
    return 'IPv4';
  } else if (isIPv6(ip)) {
    return 'IPv6';
  } else {
    return 'Neither';
  }
}

bool isIPv4(String ip) {
  final List<String> tokens = ip.split('.');
  if (tokens.length != 4) {
    return false;
  }

  try {
    for (String token in tokens) {
      if (token.isEmpty ||
          token.length > 3 ||
          token.startsWith('0') ||
          int.tryParse(token) > 255) {
        return false;
      }
    }
  } catch (e) {
    return false;
  }
  return true;
}

bool isIPv6(String ip) {
  final List<String> tokens = ip.split(':');
  if (tokens.length != 8) {
    return false;
  }

  for (String token in tokens) {
    if (token.isEmpty || token.length > 4) {
      return false;
    }
  }
  return true;
}
