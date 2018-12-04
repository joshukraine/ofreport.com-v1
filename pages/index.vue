<template lang="pug">
div
  component(
    v-if="story.content.component"
    :key="story.content._uid"
    :blok="story.content"
    :is="story.content.component")
</template>

<script>
import storyblokLivePreview from '@/mixins/storyblokLivePreview'

export default {
  mixins: [
    storyblokLivePreview
  ],
  data () {
    return { story: { content: {} } }
  },
  asyncData (context) {
    // Check if we are in the editor mode
    let version = context.query._storyblok || context.isDev ? 'draft' : 'published'

    // Load the JSON from the API
    return context.app.$storyapi.get('cdn/stories/home', {
      version: version
    }).then((res) => {
      console.log(res.data)
      return res.data
    }).catch((res) => {
      context.error({ statusCode: res.response.status, message: res.response.data })
    })
  }
}
</script>

<style>
.alpha {
  background-image: url("~assets/images/josh-kels-cover-768w.jpg");
  min-height: 100vh;
}

@media (min-width: 768px) {
  .alpha {
    background-image: url("~assets/images/josh-kels-cover-2500w.jpg");
    min-height: 70vh;
  }
}
</style>
