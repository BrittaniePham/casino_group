require_relative 'slot_machine_display'

class SlotMachine
  def initialize(wallet)
    play_slot
  end

  def play_slot
    spin_slot = SlotMachineDisplay.new
    result = spin_slot.print_slot
  end
 

end