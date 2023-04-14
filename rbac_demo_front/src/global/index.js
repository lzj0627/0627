export const mymixin ={
    methods: {
        hasAuth(perm) {
            var authority = this.$store.state.permission_list
            return authority.indexOf(perm) > -1
        }
    }
}