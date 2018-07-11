@0x903962da04a4aece;

struct BatteryState {
const powerSupplyStatusUnknown : UInt8 = 0;
const powerSupplyStatusCharging : UInt8 = 1;
const powerSupplyStatusDischarging : UInt8 = 2;
const powerSupplyStatusNotCharging : UInt8 = 3;
const powerSupplyStatusFull : UInt8 = 4;

voltage @0 : Float32;# Voltage in Volts (Mandatory)
current @1 : Float32;# Negative when discharging (A)  (If unmeasured NaN)
charge @2 : Float32;# Current charge in Ah  (If unmeasured NaN)
capacity @3 : Float32;# Capacity in Ah (last full capacity)  (If unmeasured NaN)
designCapacity @4 : Float32;# Capacity in Ah (design capacity)  (If unmeasured NaN)
percentage @5 : Float32;# Charge percentage on 0 to 1 range  (If unmeasured NaN)
powerSupplyStatus @6 : UInt8;# The charging status as reported. Values defined above
powerSupplySealth @7 : UInt8;# The battery health metric. Values defined above
powerSupplyTechnology @8 : UInt8;# The battery chemistry. Values defined above
present @9 : Bool;# True if the battery is present
cellVoltage @10 : List(Float32);# An array of individual cell voltages for each cell in the pack
location @11 : Text;# The location into which the battery is inserted. (slot number or plug)
serialNumber @12 : Text;# The best approximation of the battery serial number
}
