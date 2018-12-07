<template lang="pug">
div
  component(
    v-if="story.content.component"
    :key="story.content._uid"
    :blok="story.content"
    :is="story.content.component")
  ol
    li(v-for="article in articles") {{ article.name }}
</template>

<script>
import storyblokLivePreview from '@/mixins/storyblokLivePreview'

export default {
  mixins: [
    storyblokLivePreview
  ],
  data () {
    return {
      story: { content: {} },
      articles: []
    }
  },
  async asyncData (context) {
    let version = context.query._storyblok || context.isDev ? 'draft' : 'published'
    const homeResponse = await context.app.$storyapi.get('cdn/stories/home', {
      version: version
    })
    const articlesResponse = await context.app.$storyapi.get('cdn/stories', {
      excluding_fields: 'segments',
      per_page: 10,
      sort_by: 'published_at:desc',
      starts_with: 'blog',
      version: version
    })
    return {
      story: homeResponse.data.story,
      articles: articlesResponse.data.stories
    }
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
