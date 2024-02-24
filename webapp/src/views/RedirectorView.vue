<template>
  <div></div>
</template>
<script>
export default {
  name: 'RedirectorView',
  mounted() {
    if(this.$route.query.hash)
      this.$cookies.set("hash", this.$route.query.hash, "30d");
    if(this.$route.query.id)
      this.$cookies.set("id", this.$route.query.id, "30d");
    if(this.$route.query.token)
      this.$cookies.set("token", this.$route.query.token, "30d");
    this.$router.push({path: this.$route.query.path});
  }
}
</script>