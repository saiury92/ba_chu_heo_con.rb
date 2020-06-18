# encoding: UTF-8

require_relative './ba_chu_heo_con'
require 'minitest/autorun'

describe VậtLiệu do
  describe Rơm do
    before { @rơm = Rơm.new }
    describe '#mức_gió_chịu_được' do
      it 'phải trả về 1' do
        assert_equal 1, @rơm.mức_gió_chịu_được
      end
    end
  end

  describe Gỗ do
    before { @gỗ = Gỗ.new }
    describe '#mức_gió_chịu_được' do
      it 'phải trả về 2' do
        assert_equal 2, @gỗ.mức_gió_chịu_được
      end
    end
  end

  describe Gạch do
    before { @gạch = Gạch.new }
    describe '#mức_gió_chịu_được' do
      it 'phải trả về 999' do
        assert_equal 999, @gạch.mức_gió_chịu_được
      end
    end
  end
end

describe Nhà do
  describe 'Nhà rơm' do
    before(:all) { @nhà = Nhà.new(Rơm.new) }

    describe '#vật_liệu' do
      it 'phải trả về đối tượng lớp Rơm' do
        assert_instance_of Rơm, @nhà.vật_liệu
      end
    end

    describe '#đổ?' do
      describe 'Sức gió 1' do
        it 'phải trả về true' do
          assert_equal true, @nhà.đổ?(1)
        end
      end
    end
  end

  describe 'Nhà gỗ' do
    before(:all) { @nhà = Nhà.new(Gỗ.new) }

    describe '#vật_liệu' do
      it 'phải trả về đối tượng lớp gỗ' do
        assert_instance_of Gỗ, @nhà.vật_liệu
      end
    end

    describe '#đổ?' do
      describe 'Sức gió 1' do
        it 'phải trả về false' do
          assert_equal false, @nhà.đổ?(1)
        end
      end

      describe 'Sức gió 2' do
        it 'phải trả về true' do
          assert_equal true, @nhà.đổ?(2)
        end
      end
    end
  end

  describe 'Nhà gạch' do
    before(:all) { @nhà = Nhà.new(Gạch.new) }

    describe '#vật_liệu' do
      it 'phải trả về đối tượng lớp  gạch' do
        assert_instance_of Gạch, @nhà.vật_liệu
      end
    end

    describe '#đổ?' do
      describe 'Sức gió 1' do
        it 'phải trả về false' do
          assert_equal false, @nhà.đổ?(1)
        end
      end

      describe 'Sức gió 2' do
        it 'phải trả về false' do
          assert_equal false, @nhà.đổ?(2)
        end
      end

      describe 'Sức gió 3' do
        it 'phải trả về false' do
          assert_equal false, @nhà.đổ?(3)
        end
      end
    end
  end
end