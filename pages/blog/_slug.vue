<template lang="pug">
.container(v-editable="story.content" class="blog")
  component(
    :key="segment._uid"
    v-for="segment in story.content.segments"
    :segment="segment"
    :is="segment.component")
</template>

<script>
import storyblokLivePreview from '@/mixins/storyblokLivePreview'

export default {
  mixins: [
    storyblokLivePreview
  ],
  data () {
    return { story: { content: { segments: '' } } }
  },
  asyncData (context) {
    let version = context.query._storyblok || context.isDev ? 'draft' : 'published'
    let endpoint = `cdn/stories/blog/${context.params.slug}`

    return context.app.$storyapi.get(endpoint, {
      version: version,
      cv: Math.floor(Date.now() / 1e3)
    }).then((res) => {
      return res.data
    }).catch((res) => {
      context.error({ statusCode: res.response.status, message: res.response.data })
    })
  }
}
</script>
