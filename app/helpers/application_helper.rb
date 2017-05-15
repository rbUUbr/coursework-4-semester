module ApplicationHelper
  def subgroup_text(subgroup)
    if subgroup == 1
      return '1'
    elsif subgroup == 2
      return '2'
    else
      return 'common'
    end
  end
end
