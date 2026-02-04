// =======================
// INTERFACE: Remote
// =======================
// Trong Dart, class này được dùng như một INTERFACE
// => Không quan tâm implementation, chỉ định nghĩa hành vi
abstract class Remote {
  void powerOn();
  void powerOff();
  void volumeUp();
  void volumeDown();
}

// =======================
// CLASS: Television
// =======================
// Television IMPLEMENTS Remote
// => Bắt buộc phải override TẤT CẢ method của Remote
class Television implements Remote {
  int _volume = 10;
  bool _isOn = false;

  @override
  void powerOn() {
    _isOn = true;
    print("Television is ON");
  }

  @override
  void powerOff() {
    _isOn = false;
    print("Television is OFF");
  }

  @override
  void volumeUp() {
    if (_isOn) {
      _volume++;
      print("Volume tăng lên: $_volume");
    } else {
      print("TV đang tắt, không tăng volume được");
    }
  }

  @override
  void volumeDown() {
    if (_isOn && _volume > 0) {
      _volume--;
      print("Volume giảm xuống: $_volume");
    } else {
      print("Không thể giảm volume");
    }
  }
}

// =======================
// MAIN FUNCTION
// =======================
void main() {
  // Dùng Remote như kiểu dữ liệu (tính đa hình)
  Remote remote = Television();

  remote.powerOn();
  remote.volumeUp();
  remote.volumeUp();
  remote.volumeDown();
  remote.powerOff();
}
