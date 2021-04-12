module RepliesHelper
    include CableReady::Broadcaster

    def dispatch_reply(user_id, post_id, content)
        cable_ready["notifs"].dispatch_event(
            name: "notify",
            detail: {
                id: post_id,
                title: Post.find(post_id).title,
                content: content,
                from_name: User.find(user_id).first_name,
                from_id: user_id,
                users: Post.find(post_id).replies.pluck(:user_id).uniq,
                is_match: false
            }
          )
        cable_ready.broadcast
    end
end
