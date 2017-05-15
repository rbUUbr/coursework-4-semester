module ApplicationHelper
  def subgroup_text(subgroup)
    if subgroup == 1
      '1'
    elsif subgroup == 2
      '2'
    else
      'common'
    end
  end
end
