
#
# Specifying rufus-scheduler-em
#
# Sat Mar 21 20:19:30 JST 2009
#

require File.dirname(__FILE__) + '/spec_base'


describe "#{SCHEDULER_CLASS}#schedule_at" do

  before do
    @s = start_scheduler
  end
  after do
    stop_scheduler(@s)
  end

  it 'should have job ids with the class name in it' do

    j0 = @s.at(Time.now + 1) {}
    j0.job_id.should.match(/Rufus::Scem::AtJob/)
  end

  it "should accept integers as 'at'" do

    lambda { @s.at(1) {} }.should.not.raise
  end

  it "should schedule at 'top + 1'" do

    var = nil

    @s.at Time.now + 1 do
      var = true
    end

    var.should.be.nil
    sleep 1.5

    var.should.be.true
    @s.jobs.should.be.empty
  end

  it 'should trigger immediately jobs in the past' do

    var = nil

    @s.at Time.now - 2 do
      var = true
    end

    #wait_next_tick
    sleep 0.500

    var.should.be.true
    @s.jobs.should.be.empty
  end

  it 'should unschedule' do

    job = @s.at Time.now + 3 * 3600 do
    end

    wait_next_tick

    @s.jobs.size.should.equal(1)

    @s.unschedule(job.job_id)
  end

end

describe 'Rufus::Scem::AtJob' do

  before do
    @s = start_scheduler
  end
  after do
    stop_scheduler(@s)
  end

  it 'should unschedule itself' do

    job = @s.at Time.now + 3 * 3600 do
    end

    wait_next_tick

    job.unschedule

    @s.jobs.size.should.equal(0)
  end
end

