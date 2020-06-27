birds = ['raven', 'finch', 'eagle']


def types(*birds)
  yield(birds)
end

types('raven', 'finch', 'eagle') { p birds }
types(['raven', 'finch', 'eagle']) { p birds }