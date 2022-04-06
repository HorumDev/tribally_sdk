part of tribally_sdk;

extension ColorToHexString on Color {
  toHexString(){
    return value.toRadixString(16).padLeft(8, '0');
  }
}