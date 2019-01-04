class PassengerTrain < Train
  validate :number, :presence
  validate :number, :format, NUMBER_TRAIN
end
