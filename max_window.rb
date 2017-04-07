def max_windowed_range(array, window_size)
  current_max_range = nil
  all_windows = array.each_cons(window_size).to_a
  all_windows.each do |window|
    if current_max_range.nil? || window.max - window.min > current_max_range
      current_max_range = window.max - window.min
      # p window
    end
  end
  current_max_range
end

p max_windowed_range([1, 0, 2, 5, 4, 8], 3)

git filter-branch -f --env-filter "GIT_AUTHOR_NAME='Jon Jaffe'; GIT_AUTHOR_EMAIL='your_email'; GIT_COMMITTER_NAME='Jon Jaffe'; GIT_COMMITTER_EMAIL='your_email';" HEAD
