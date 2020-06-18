# encoding: UTF-8

require_relative './ba_chu_heo_con'
require 'minitest/autorun'

describe 'Chuyện ba chú heo con' do
  before(:all) do
    @sói         = Sói.new
    @heo_út      = Heo.new('út')
    @heo_anh_nhì = Heo.new('anh nhì')
    @heo_cả      = Heo.new('anh cả')
  end

  describe 'Heo em út xây nhà' do
    before(:all) do
      @nhà_rơm = @heo_út.xây_nhà
    end

    it 'nhà phải bằng rơm' do
      assert_instance_of Rơm, @nhà_rơm.vật_liệu
    end

    describe 'chó sói tấn công' do
      describe 'chó sói thổi với sức gió 1' do
        it 'nhà rơm bị đổ' do
          assert @nhà_rơm.đổ?(@sói.thổi)
        end
      end
    end
  end

  describe 'Heo anh nhì xây nhà' do
    before(:all) do
      @nhà_gỗ = @heo_anh_nhì.xây_nhà
    end

    it 'nhà phải bằng gỗ' do
      assert_instance_of Gỗ, @nhà_gỗ.vật_liệu
    end

    describe 'chó sói tấn công' do
      describe 'chó sói thổi với sức gió 1' do
        it 'nhà gỗ không bị đổ' do
          refute @nhà_gỗ.đổ?(@sói.thổi)
        end
      end

      describe 'chó sói thổi với sức gió 2' do
        it 'nhà gỗ bị đổ' do
          assert @nhà_gỗ.đổ?(@sói.thổi(2))
        end
      end
    end
  end

  describe 'Heo anh cả xây nhà' do
    before(:all) { @nhà_gạch = @heo_cả.xây_nhà }

    it 'nhà phải bằng gạch' do
      assert_instance_of Gạch, @nhà_gạch.vật_liệu
    end

    describe 'chó sói tấn công' do
      describe 'chó sói thổi với sức gió 1' do
        it 'nhà gạch không bị đổ' do
          refute @nhà_gạch.đổ?(@sói.thổi)
        end
      end

      describe 'chó sói thổi với sức gió 2' do
        it 'nhà gạch không bị đổ' do
          refute @nhà_gạch.đổ?(@sói.thổi(2))
        end
      end

      describe 'chó sói thổi với sức gió 3' do
        it 'nhà gạch không bị đổ' do
          refute @nhà_gạch.đổ?(@sói.thổi(3))
        end
      end
    end
  end
end